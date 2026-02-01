---
name: leveldb-src
description: >
  Knowledge base for the LevelDB codebase at /Users/colin/repo/leveldb. Contains
  accumulated knowledge about functions, variables, data structures, and mechanisms.
  Use this skill when answering questions about LevelDB internals, before exploring
  the codebase. Check references/ for existing knowledge on the topic first.
"@import": ~/obsidian/DB/Catalog/LevelDB
---

# LevelDB Source Knowledge Base

Growing knowledge base for LevelDB codebase exploration.

## Obsidian Sync

The Obsidian vault at `~/obsidian/DB/Catalog/LevelDB/` is imported via `@import`.
When updating knowledge, write to the Obsidian vault (imported directory).

## Workflow

1. When asked about LevelDB internals, first check existing knowledge:
   - For class/struct questions → check `classes/<ClassName>.md`
   - For mechanism/flow questions → check `references/<topic>.md`
   - **Always tell user**: "Checking `<filename>`..." before reading
2. If found, use existing knowledge and answer
3. If not found or incomplete, explore codebase
4. **Always update the knowledge base:**
   - New topic → create new file
   - New details about existing topic → append to existing file
   - Corrections or deeper understanding → edit existing content
   - Related cross-references → add links between files
   - **Write to Obsidian vault** (via @import)
   - **Tell user** what was added/updated

## Directory Structure

### `classes/` - Class Documentation
One file per class, containing all methods and data members.

Example files:
- `DBImpl.md` - Main database implementation
- `TableCache.md` - SSTable file cache
- `MemTable.md` - In-memory write buffer
- `LRUCache.md` - LRU cache implementation

### `references/` - Topic Documentation
Cross-cutting concerns and data flows.

- **keys.md** - Key formats (User Key, Internal Key, Lookup Key)
- **caching.md** - Cache architecture and read path
- **compaction.md** - Background compaction, level management
- **concurrency.md** - Mutex, write batching, reference counting
- **version.md** - Sequence numbers, snapshots
- **wal.md** - Write-ahead log, recovery

## Adding Class Knowledge

Format for `classes/<ClassName>.md`:

```markdown
# ClassName (`file.h`)

Brief description.

## Data Members

### `member_name_` (`type`)
What it stores and why.

## Methods

### MethodName (`file.cc:line`)
What it does. Parameters and return value if non-obvious.
```

## Adding Topic Knowledge

Format for `references/<topic>.md`:

```markdown
### FunctionName (`file.cc:line`)
Brief description. Key parameters and return values.
```
