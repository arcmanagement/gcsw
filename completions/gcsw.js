// Completion spec for gcsw (plain .js — Kiro CLI loads .js specs, not .ts).
//
// The configuration list is generated dynamically: every time you complete,
// the generator runs `gcloud config configurations list`, so the dropdown
// always reflects your current configurations. No regeneration step needed —
// drop this file in your Kiro Specs folder once.

const completionSpec = {
  name: "gcsw",
  description: "Interactive gcloud configuration switcher",
  args: {
    name: "configuration",
    description: "gcloud configuration to switch to",
    isOptional: true,
    generators: {
      script: [
        "gcloud",
        "config",
        "configurations",
        "list",
        "--format=value(name)",
      ],
      postProcess: (out) =>
        out
          .split("\n")
          .filter((line) => line.trim().length > 0)
          .map((name) => ({
            name,
            description: "gcloud configuration",
            icon: "⚙️",
          })),
    },
  },
  options: [
    {
      name: ["-a", "--adc"],
      description:
        "Re-authenticate ADC in the browser (use when the account changes)",
    },
    { name: ["-h", "--help"], description: "Show this help" },
    { name: ["-v", "--version"], description: "Print version" },
  ],
};

export default completionSpec;
