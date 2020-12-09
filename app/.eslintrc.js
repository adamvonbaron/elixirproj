/* eslint-disable-next-line */
module.exports = {
  root: true,
  parser: "vue-eslint-parser",
  parserOptions: {
    parser: "@typescript-eslint/parser",
    sourceType: "module",
  },
  plugins: ["@typescript-eslint", "prettier"],
  extends: [
    "eslint:recommended",
    "prettier",
    "prettier/@typescript-eslint",
    "plugin:@typescript-eslint/recommended",
    "plugin:vue/recommended",
    "plugin:prettier/recommended",
  ],
  rules: {
    "prettier/prettier": ["error"],
    "vue/max-attributes-per-line": "off",
    "vue/singleline-html-element-content-newline": "off",
    "vue/html-self-closing": "off",
  },
};
