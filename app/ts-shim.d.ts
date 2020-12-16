declare module "*.vue" {
  import Vue from "vue";
  export default Vue;
}

declare module "*.graphql" {
  import { DocumentNode } from "graphql";

  const content: DocumentNode;
  export default content;
}
