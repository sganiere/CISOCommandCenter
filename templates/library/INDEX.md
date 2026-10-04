# Library Index

The library holds full reference documents — strategy papers, project lists, team lists, standards, policies — that are too long to load every session. **Only this index is loaded automatically.** Claude reads the matching document(s) when a request calls for them, and says which it used.

Maintained by `/file` (add or update a document) and `/library` (audit). Markdown only for now.

Each entry:

```
### <filename>.md — <Title>
- **Type:** strategy | project-list | team | policy | standard | reference | other
- **Summary:** one line
- **Read when:** the situations or question types where this document matters
- **Reviewed:** YYYY-MM-DD
```

The "Read when" line is the retrieval key — write it as triggers ("assessing a vendor exception", "preparing board risk committee material"), not as a topic label.

---

*(No documents yet. Add one with `/file <path-to-markdown-file>`.)*
