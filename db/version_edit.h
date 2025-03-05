// Copyright (c) 2011 The LevelDB Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file. See the AUTHORS file for names of contributors.

#ifndef STORAGE_LEVELDB_DB_VERSION_EDIT_H_
#define STORAGE_LEVELDB_DB_VERSION_EDIT_H_

#include <set>
#include <utility>
#include <vector>

#include "db/dbformat.h"

namespace leveldb {

class VersionSet;

struct FileMetaData {
  FileMetaData() : refs(0), allowed_seeks(1 << 30), file_size(0) {}

  int refs;

  // How many seeks are allowed before a compaction is triggered
  // When this number reaches zero, which means the file has been accessed frequently,
  // so merging this file with other files might be a good idea.
  int allowed_seeks;

  // File number
  uint64_t number;

  // File size in bytes
  uint64_t file_size;

  // Smallest internal key served by table
  InternalKey smallest;

  // Largest internal key served by table
  InternalKey largest;
};

class VersionEdit {
 public:
  VersionEdit() { Clear(); }

  ~VersionEdit() = default;

  void Clear();

  void SetComparatorName(const Slice& name) {
    has_comparator_ = true;
    comparator_ = name.ToString();
  }

  void SetLogNumber(uint64_t num) {
    has_log_number_ = true;
    log_number_ = num;
  }

  void SetPrevLogNumber(uint64_t num) {
    has_prev_log_number_ = true;
    prev_log_number_ = num;
  }

  void SetNextFile(uint64_t num) {
    has_next_file_number_ = true;
    next_file_number_ = num;
  }

  void SetLastSequence(SequenceNumber seq) {
    has_last_sequence_ = true;
    last_sequence_ = seq;
  }

  void SetCompactPointer(int level, const InternalKey& key) {
    compact_pointers_.push_back(std::make_pair(level, key));
  }

  // Add the specified file at the specified number.
  // REQUIRES: This version has not been saved (see VersionSet::SaveTo)
  // REQUIRES: "smallest" and "largest" are smallest and largest keys in file
  //
  // Build a FileMetaData, and then insert (level, FileMetaData) into new_files_.
  void AddFile(int level, uint64_t file, uint64_t file_size,
               const InternalKey& smallest, const InternalKey& largest) {
    FileMetaData f;
    f.number = file;
    f.file_size = file_size;
    f.smallest = smallest;
    f.largest = largest;
    new_files_.push_back(std::make_pair(level, f));
  }

  // Delete the specified "file" from the specified "level".
  void RemoveFile(int level, uint64_t file) {
    deleted_files_.insert(std::make_pair(level, file));
  }

  // Encode VersionEdit to a string for storage in a manifest file.
  void EncodeTo(std::string* dst) const;

  // Decode "src" to assign to *this.
  Status DecodeFrom(const Slice& src);

  std::string DebugString() const;

 private:
  friend class VersionSet;

  // Which comparator is used
  std::string comparator_;

  // The log file number of a MANIFEST file
  // The changes in this version will be written to this file
  uint64_t log_number_;

  uint64_t prev_log_number_;
  uint64_t next_file_number_;
  SequenceNumber last_sequence_;

  bool has_comparator_;
  bool has_log_number_;
  bool has_prev_log_number_;
  bool has_next_file_number_;
  bool has_last_sequence_;

  // pair((level, InternalKey))
  // Store the compact pointers for different levels
  std::vector<std::pair<int, InternalKey>> compact_pointers_;

  // set((level, file number))
  typedef std::set<std::pair<int, uint64_t>> DeletedFileSet;
  DeletedFileSet deleted_files_;

  // vector((level, FileMetaData))
  std::vector<std::pair<int, FileMetaData>> new_files_;
};

}  // namespace leveldb

#endif  // STORAGE_LEVELDB_DB_VERSION_EDIT_H_
