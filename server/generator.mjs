import { faker } from "@faker-js/faker";

export const generateRandomObject = (maxLevels = 10) => {
  function generateRandomValue(level) {
    if (level >= maxLevels) {
      return null;
    }
    const baseValues = [
      null,
      undefined,
      true,
      false,
      Math.random(),
      faker.lorem.sentence({ min: 3, max: 7 }),
      "object",
      "array",
      "object",
      "array",
      "object",
      "array",
      "object",
      "array",
    ];
    const value = baseValues[Math.floor(Math.random() * baseValues.length)];

    if (value === "object") {
      // Generate nested object
      const obj = {};
      const numKeys = Math.floor(Math.random() * 3) + 1; // Random number of keys (1-5)

      for (let i = 0; i < numKeys; i++) {
        const isNumericKey = Math.random() < 0.5; // Determine if the key should be numeric
        const key = isNumericKey ? i : Math.random().toString(36).substring(7);
        obj[key] = generateRandomValue(level + 1); // Recursively generate value
      }

      return obj;
    } else if (value == "array") {
      // Generate nested array
      const arr = [];
      const length = Math.floor(Math.random() * 5) + 1; // Random array length (1-5)

      for (let i = 0; i < length; i++) {
        arr.push(generateRandomValue(level + 1)); // Recursively generate value
      }

      return arr;
    }
    return value;
  }

  return generateRandomValue(0);
};
