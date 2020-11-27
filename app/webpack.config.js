const path = require("path");
const webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

module.exports = {
  entry: "./src/index.ts",
  mode: "development",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "index.bundle.js",
  },
  devtool: "inline-source-map",
  devServer: {
    hot: true,
    contentBase: "./dist",
    historyApiFallback: true,
    proxy: {
      "/graphql": "http://localhost:3000",
    },
  },
  module: {
    rules: [
      {
        test: /\.ts$/,
        exclude: /node_modules/,
        use: ["ts-loader"],
      },
      {
        test: /\.vue$/,
        use: ["vue-loader"],
      },
      {
        test: /\.css$/,
        use: [
        {
            loader: "vue-style-loader"
        },
          {
            loader: "style-loader",
          },
          {
            loader: "css-loader",
            options: {
              importLoaders: 1,
            },
          },
        ],
      },
      {
        test: /\.s[ac]ss$/i,
        use: ["style-loader", "css-loader", "sass-loader"],
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: ["file-loader"],
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/,
        use: ["file-loader"],
      },
    //   {
    //     test: /\.(graphql|gql)$/,
    //     exclude: /node_modules/,
    //     use: ["graphql-tag/loader"],
    //   },
    ],
  },
  plugins: [
    new HtmlWebpackPlugin({
      title: "loquor",
      template: "src/index.html",
    }),
    new VueLoaderPlugin(),
    new webpack.HotModuleReplacementPlugin(),
  ],
  resolve: {
    extensions: [".vue", ".ts", ".js", ".sass", ".scss"],
    alias: {
      "@": path.resolve(__dirname, "src"),
    },
  },
};