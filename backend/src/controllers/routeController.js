const calculateRoute = async (req, res) => {
  const { origin, destination } = req.body;

  if (!origin || !destination) {
    return res
      .status(400)
      .json({ error: "Origin and destination are required" });
  }

  // Mocked routes (replace with real route calculations later)
  const routes = [
    {
      routeId: 1,
      score: 82.5,
      path: [
        [32.08, 34.78],
        [32.07, 34.79],
        [32.06, 34.8],
      ],
    },
    {
      routeId: 2,
      score: 74.2,
      path: [
        [32.08, 34.78],
        [32.075, 34.785],
        [32.06, 34.8],
      ],
    },
  ];

  res.status(200).json(routes);
};

module.exports = { calculateRoute };
