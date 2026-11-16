import { useEffect, useState } from "react";
import { Moon, Sun } from "lucide-react";

type Theme = "light" | "dark";

export function ThemeToggle() {
  const [theme, setTheme] = useState<Theme>("light");

  useEffect(() => {
    const saved: Theme = localStorage.getItem("astra-theme") === "dark" ? "dark" : "light";
    setTheme(saved);
    document.documentElement.classList.toggle("dark", saved === "dark");
  }, []);

  function toggleTheme() {
    const next: Theme = theme === "dark" ? "light" : "dark";
    setTheme(next);
    document.documentElement.classList.toggle("dark", next === "dark");
    localStorage.setItem("astra-theme", next);
  }

  return (
    <button
      type="button"
      aria-label={`Switch to ${theme === "dark" ? "light" : "dark"} theme`}
      title={`${theme === "dark" ? "Light" : "Dark"} theme`}
      onClick={toggleTheme}
      className="hover:text-burgundy"
    >
      {theme === "dark"
        ? <Sun className="size-[18px]" strokeWidth={1.4} />
        : <Moon className="size-[18px]" strokeWidth={1.4} />}
    </button>
  );
}
