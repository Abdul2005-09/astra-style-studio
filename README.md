# ASTRA Style Studio

@connector:github:"GitHub API" https://github.com/Abdul2005-09/pixel-perfect-replica-dbd8e849.gitPlease complete Task 4 (End-to-End Verification and Smoke Testing) for ASTRA STYLIN.

Tasks 1, 2, and 3 from the specification are already fully implemented and passing unit tests (Bag & Wishlist Supabase sync with guest merge, Admin KPI dashboard and Product Editor with image uploads and color variants, Account profile/address CRUD, and Password Reset flow).

Please run the full verification in Build mode:

1. Run `bunx vitest run` to verify all test suites pass.

2. Verify database tables (products, inventory, orders, cart_items, product_images, addresses) and the 'product-images' storage bucket.

3. Test the live flows:

   - Create a test user at /login and trigger `claim_first_admin` on /account to gain admin access.

   - Verify /admin displays KPI metrics and product management.

   - Place a test order through /checkout; verify order appears in /account and /admin, and inventory stock decrements.

   - Cancel the order in /admin and verify inventory stock is automatically restored via `admin_set_order_status`.

   - Verify guest cart items merge into the database cart upon login.

4. Fix any edge cases or runtime issues encountered.

This project was built with [Lovable](https://lovable.dev).

## Build with Lovable

Continue developing this project in the [Lovable editor](https://lovable.dev/projects/99004cc8-711c-45d2-926a-77358af22195).

- **Ship faster**: describe what you want to build and Lovable handles the code.
- **Stay in sync**: every change made in Lovable is committed straight to this repository.
- **Full ownership**: this code is yours. Push to `main` on GitHub and your changes sync back into Lovable, ready for your next prompt.

## Development

Prefer working locally? You need Node.js and npm — [install with nvm](https://github.com/nvm-sh/nvm#installing-and-updating).

```sh
git clone <this-repository-url>
cd <repository-name>
npm i
npm run dev
```
