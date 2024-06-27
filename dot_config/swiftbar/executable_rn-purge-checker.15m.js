#!/usr/bin/env deno run --allow-net

// Fetch the latest 10 workflow runs from the GitHub Actions API
const response = await fetch(
  "https://api.github.com/repos/react-native-community/rn-diff-purge/actions/runs?per_page=2"
);
const data = await response.json();

// Extract the status, name, and timestamp of the last 10 actions
const workflowRuns = data.workflow_runs.map((run) => ({
  status: run.conclusion,
  name: run.name,
  timestamp: run.updated_at,
}));

// Find the latest failed run
const latestFailedRun = workflowRuns.find((run) => run.status === "failure");

if (latestFailedRun) {
  console.log(
    "oops"
    // `oops - latest fail: ${latestFailedRun.name} at ${latestFailedRun.timestamp}`
  );
} else {
  console.log("green");
}
