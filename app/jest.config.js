module.exports = {
  moduleFileExtensions: ["js", "ts", "json", "vue"],
  transform: {
    ".*\\.(vue)$": "vue-jest",
    "^.+\\.(ts)$": "ts-jest",
  },
  moduleNameMapper: {
    "^@/(.*)$": "<rootDir>/src/$1",
  },
  collectCoverage: true,
  collectCoverageFrom: ["**/*.{ts,vue}", "!**/node_modules/**"],
  testRegex: "(/__tests__/.*|(\\.|/)(test|spec))\\.(js|ts)$",
};
