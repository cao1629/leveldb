# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

```bash
# Build (from repository root)
mkdir -p build && cd build
cmake -DCMAKE_BUILD_TYPE=Release .. && cmake --build .

# Build with debug symbols
cmake -DCMAKE_BUILD_TYPE=Debug .. && cmake --build .

# Run all tests
cd build && ctest

# Run the test executable directly
./build/leveldb_tests

# Run a specific test (use --gtest_filter)
./build/leveldb_tests --gtest_filter=DBTest.*
./build/leveldb_tests --gtest_filter=*Compaction*

# Format code (required before submitting)
clang-format -i --style=file <file>

# Run benchmarks
./build/db_bench
```

## CMake Options

- `LEVELDB_BUILD_TESTS=ON` - Build unit tests (default ON)
- `LEVELDB_BUILD_BENCHMARKS=ON` - Build benchmarks (default ON)
- `BUILD_SHARED_LIBS=ON` - Build shared library instead of static

## Architecture Overview

LevelDB is an LSM-tree (Log-Structured Merge-tree) key-value store inspired by Google Bigtable.

### Core Components

**db/** - Database engine
- `db_impl.cc/h` - Main `DBImpl` class implementing the `DB` interface. Manages memtables, compaction scheduling, snapshots, and recovery
- `memtable.cc/h` - In-memory write buffer backed by a skiplist (`skiplist.h`)
- `version_set.cc/h` - Tracks which SSTable files exist at each level, manages MANIFEST
- `write_batch.cc` - Atomic batch operations
- `log_writer.cc/h`, `log_reader.cc/h` - Write-ahead log (WAL) implementation

**table/** - SSTable format
- `table_builder.cc` - Builds SSTable files from sorted key-value pairs
- `table.cc` - Reads SSTable files
- `block.cc/h`, `block_builder.cc/h` - Block-level storage with prefix compression
- `filter_block.cc/h` - Bloom filter support for faster negative lookups

**util/** - Utilities and OS abstraction
- `env_posix.cc`, `env_windows.cc` - Platform-specific file I/O
- `arena.cc/h` - Memory pool allocator used by memtable
- `cache.cc` - LRU block cache
- `coding.cc/h` - Variable-length integer encoding

**port/** - Platform abstraction layer
- `port_stdcxx.h` - Mutex, CondVar, thread implementations using C++11

**include/leveldb/** - Public API headers (stable, do not break compatibility)

### Data Flow

**Write path:**
1. Write to WAL (log file)
2. Insert into MemTable (skiplist)
3. When MemTable reaches ~4MB, flush to Level-0 SSTable
4. Background compaction merges levels

**Read path:**
1. Check MemTable
2. Check immutable MemTable (if being flushed)
3. Search SSTable files from Level-0 down

### SSTable Caching

LevelDB uses a two-level caching system:

**Table Cache** (`db/table_cache.cc`) - Caches open SSTable files
- Key: 8-byte file number
- Value: `TableAndFile` (file handle + parsed Table metadata)
- Avoids reopening/reparsing SSTable files on each access

**Block Cache** (`util/cache.cc`) - Caches data blocks within SSTables
- Key: 16 bytes = `[table_cache_id][block_offset]`
- Value: Decompressed `Block*` data
- Sharded LRU design (16 shards) for concurrent access
- Configured via `Options::block_cache`

Read path: `TableCache::Get()` → `FindTable()` (table cache lookup) → `Table::InternalGet()` → `BlockReader()` (block cache lookup) → `ReadBlock()` on cache miss

### File Types in Database Directory

- `*.log` - Write-ahead log
- `*.ldb` - SSTable files (sorted tables)
- `MANIFEST-*` - Database state (which files at which levels)
- `CURRENT` - Points to current MANIFEST
- `LOCK` - Process lock file
- `LOG`, `LOG.old` - Diagnostic logs

## Code Style

- Follows [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- C++11 required, no exceptions, no RTTI
- Thread safety annotations used with `-Wthread-safety` (Clang)
- Use `clang-format -i --style=file` before submitting

## Testing Notes

- Tests use Google Test framework
- `util/testutil.cc/h` provides test helpers
- Some tests are disabled for shared library builds (see CMakeLists.txt)
- `helpers/memenv/` provides in-memory Env for testing without disk I/O

## Repository Status

This repository is in limited maintenance mode. Only critical bug fixes and changes required by internal clients are accepted.
