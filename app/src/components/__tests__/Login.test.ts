import { shallowMount } from "@vue/test-utils";
import Login from "@/components/Login.vue";

describe("Login.vue", () => {
  test("renders", () => {
    const wrapper = shallowMount(Login);
    expect(wrapper).toMatchSnapshot();
  });
});
