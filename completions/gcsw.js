// Completion spec for gcsw (plain .js — Kiro CLI loads .js specs, not .ts).
//
// Configuration names are generated dynamically at completion time, so the
// dropdown reflects the current `gcloud config configurations list`.
//
// `gcsw update` writes a copy of this spec (with the current configurations
// also baked in as static suggestions) into your Kiro Specs folder. This file
// is the reference / starting point.

const completionSpec = {
  name: "gcsw",
  description: "Interactive gcloud configuration switcher",
  subcommands: [
    {
      name: "update",
      description: "Refresh the completion spec from the current configuration list",
    },
  ],
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
