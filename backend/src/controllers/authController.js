const pool = require("../db/pool"); // PostgreSQL connection pool

// Generate a 5-digit random verification code
const generateCode = () => Math.floor(10000 + Math.random() * 90000);

const registerUser = async (req, res) => {
  const { phone, email } = req.body;

  // Basic validation
  if (!phone || !email) {
    return res.status(400).json({ error: "Phone and email are required" });
  }

  const code = generateCode();

  try {
    // Insert or update the user
    const result = await pool.query(
      `
      INSERT INTO users (phone, email, preferences)
      VALUES ($1, $2, jsonb_build_object('code', $3))
      ON CONFLICT (phone)
      DO UPDATE SET preferences = jsonb_build_object('code', $3)
      RETURNING *
      `,
      [phone, email, code]
    );

    console.log(`📲 Verification code for ${phone}: ${code}`);

    res.status(200).json({ message: "Verification code sent successfully" });
  } catch (err) {
    console.error("Error during registration:", err);
    res.status(500).json({ error: "Error during registration" });
  }
};

module.exports = { registerUser };
