import { describe, expect, it } from "vitest";
import { resolveImageUrl } from "@/lib/catalog-images";

describe("catalogue photo links", () => {
  it("maps old hosted links to the local catalogue copy", () =>
    expect(resolveImageUrl("/__l5e/assets-v1/0bf6df3d-8482-46e8-9a86-9042234cb624/paris-polo-product.jpg")).toBe("/catalog/paris-polo-product.jpg"));
  it("leaves admin-uploaded photos untouched", () =>
    expect(resolveImageUrl("storage:products/abc.jpg")).toBe("storage:products/abc.jpg"));
  it("leaves unknown hosted files untouched", () =>
    expect(resolveImageUrl("/__l5e/assets-v1/x/unknown.jpg")).toBe("/__l5e/assets-v1/x/unknown.jpg"));
});
