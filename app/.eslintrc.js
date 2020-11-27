module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  plugins: ["@typescript-eslint", "prettier"],
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier/@typescript-eslint",
    "plugin:vue/essential",
    "plugin:prettier/recommended",
    "prettier",
  ],
  rules: {
    "prettier/prettier": ["error"],
  },
};
