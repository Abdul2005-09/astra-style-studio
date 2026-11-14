/**
 * Catalogue photos and brand logos are served from public/catalog/ so they work on any domain.
 * Older product rows store links like "/__l5e/assets-v1/<id>/<file>"; those map to /catalog/<file>.
 */
export const CATALOG_FILES = [
  "astra-logo-full-light.png", "astra-logo-full.png", "astra-logo-mark-light.png", "astra-logo-mark.png",
  "campaign-paris-polo-cover.jpg",
  "classic-white-henley-model.jpg", "classic-white-henley-product.jpg",
  "monogram-raglan-tshirt-model.jpg", "monogram-raglan-tshirt-product.jpg",
  "navy-wave-stripe-zip-polo-model.jpg", "navy-wave-stripe-zip-polo-product.jpg",
  "paris-polo-model.jpg", "paris-polo-product.jpg",
  "pepe-jeans-polo-model.jpg", "pepe-jeans-polo-product.jpg",
  "premium-zip-polo-model.jpg", "premium-zip-polo-product.jpg",
  "textured-knit-tshirt-model.jpg", "textured-knit-tshirt-product.jpg",
  "textured-polo-model.jpg", "textured-polo-product.jpg",
  "textured-zip-polo-model.jpg", "textured-zip-polo-product.jpg",
  "visca-barca-quarter-zip-model.jpg", "visca-barca-quarter-zip-product.jpg",
  "white-navy-half-zip-polo-model.jpg", "white-navy-half-zip-polo-product.jpg",
  "xoxo-graphic-tshirt-model.jpg", "xoxo-graphic-tshirt-product.jpg",
] as const;
export type CatalogFile = (typeof CATALOG_FILES)[number];

export const catalogImage = (file: CatalogFile) => `/catalog/${file}`;

const KNOWN = new Set<string>(CATALOG_FILES);

/** Turn a stored product photo link into one that loads here; other links pass through unchanged. */
export function resolveImageUrl(url: string): string {
  const m = /^\/__l5e\/assets-v1\/[^/]+\/([^/?#]+)$/.exec(url);
  if (m && KNOWN.has(m[1]!)) return `/catalog/${m[1]}`;
  return url;
}
