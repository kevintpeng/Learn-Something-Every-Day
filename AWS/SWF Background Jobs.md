# SWF
**Simple Workflow Service** gives you control of coordinating tasks done by applications
- this is multi-step background jobs, like handling an online order
- SWF facilitates these workflows with many tasks (Lambda, activity tasks, decision tasks)
- **actors** are just their term for processes owned by SWF that are the different components of the entire system
  - **decider** uses the history log of tasks performed to determine which task to run next
  - the decider can choose to complete, cancel, or fail an open workflow execution
  - **workflow starter** instantiates a workflow with an empty history
- deciders and activity workers communicate using long polling
