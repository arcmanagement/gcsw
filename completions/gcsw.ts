// Fig / Amazon Q / Kiro CLI completion spec for gcsw.
//
// The configuration list is generated dynamically at completion time, so the
// dropdown always reflects the current `gcloud config configurations list`.
//
// To use with Kiro CLI / Amazon Q / Fig, place this spec where your tool loads
// custom autocomplete specs (see README "Shell completion").
const completionSpec: Fig.Spec = {
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
