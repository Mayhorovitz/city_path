const pool = require("../db/pool");

//5 digits random verification code
const generateCode = () => Math.floor(10000 + Math.random() * 90000);

// Handle user registration and code generation
const registerUser = async (req, res) => {
  const { phone, email } = req.body;

  if (!phone || !email) {
    return res.status(400).json({ error: "Phone and email are required" });
  }

  const code = generateCode();

  try {
    // Insert or update the user with a new code
    const result = await pool.query(
      `
        INSERT INTO users (phone, email, preferences)
        VALUES ($1, $2, jsonb_build_object('code', $3::text))
        ON CONFLICT (phone)
        DO UPDATE SET preferences = jsonb_build_object('code', $3::text)
        RETURNING *
        `,
      [phone, email, code]
    );

    console.log(`Verification code for ${phone}: ${code}`);

    res.status(200).json({ message: "Verification code sent successfully" });
  } catch (err) {
    console.error("Error during registration:", err);
    res.status(500).json({ error: "Error during registration" });
  }
};

// Handle code verification
const verifyCode = async (req, res) => {
  const { phone, code } = req.body;

  if (!phone || !code) {
    return res.status(400).json({ error: "Phone and code are required" });
  }

  try {
    const result = await pool.query(
      `SELECT preferences FROM users WHERE phone = $1`,
      [phone]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "User not found" });
    }

    const storedCode = result.rows[0].preferences?.code;

    if (!storedCode) {
      return res
        .status(400)
        .json({ error: "No verification code found for this user" });
    }

    if (storedCode === code.toString()) {
      // ✅ Update user: set verified = true and remove code from preferences
      await pool.query(
        `
          UPDATE users
          SET verified = true,
              preferences = preferences - 'code'
          WHERE phone = $1
          `,
        [phone]
      );

      return res.status(200).json({ message: "Verification successful" });
    } else {
      return res.status(401).json({ error: "Invalid verification code" });
    }
  } catch (err) {
    console.error("Error during verification:", err);
    res.status(500).json({ error: "Error during verification" });
  }
};
module.exports = {
  registerUser,
  verifyCode,
};
