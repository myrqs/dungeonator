const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "dungeonator",
        .target = target,
        .optimize = optimize,
    });

    lib.addIncludePath(.{ .path = "include" });

    const pcg_basic_dep = b.dependency("pcg_basic", .{
        .optimize = optimize,
        .target = target,
    });
    lib.addIncludePath(pcg_basic_dep.path("."));

    lib.addCSourceFiles(.{ .files = &generic_src_files });
    lib.linkLibC();
    lib.installHeadersDirectory(b.path("src"), "dungeonator", .{ .include_extensions = &.{".h"} });
    lib.linkLibrary(pcg_basic_dep.artifact("pcg_basic"));

    b.installArtifact(lib);
}

const generic_src_files = [_][]const u8{
    "src/connectors.c",
    "src/dead_ends.c",
    "src/direction.c",
    "src/generate.c",
    "src/grid.c",
    "src/maze.c",
    "src/rooms.c",
    "src/tile.c",
    "src/util.c",
};
