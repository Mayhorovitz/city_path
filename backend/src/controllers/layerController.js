const pool = require("../db/pool");

const getLayerData = async (req, res) => {
  const { type } = req.query;

  if (!type) {
    return res.status(400).json({ error: "Layer type is required" });
  }

  try {
    const result = await pool.query(
      `SELECT data FROM layers WHERE type = $1 ORDER BY updated_at DESC LIMIT 1`,
      [type]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Layer not found" });
    }

    res.status(200).json(result.rows[0].data);
  } catch (err) {
    console.error("Error fetching layer:", err);
    res.status(500).json({ error: "Error fetching layer data" });
  }
};

module.exports = { getLayerData };
