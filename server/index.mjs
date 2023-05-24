import http from "http";
import { generateRandomObject } from "./generator.mjs";

const server = http.createServer((_req, res) => {
  const result = generateRandomObject();
  res.setHeader(
    "Access-Control-Allow-Origin",
    "*"
  );
  res.setHeader("Content-Type", "application/json");
  res.end(JSON.stringify(result));
});

const port = process.env.PORT || 8080;

server.listen(8080, () => {
  console.log(`server is running on: http://localhost:${port}`);
});
