package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_scala//scala:scala_toolchain.bzl", "scala_toolchain")

scala_toolchain(
    name = "scala_toolchain_impl",
    scalacopts = [
        "-Ywarn-unused",
        "-unchecked",
        "-deprecation",
        "-feature",
        "-language:postfixOps",
        "-target:jvm-1.8",
        "-Xlint",
        "-Ywarn-dead-code",
        "-Xfatal-warnings",
        "-encoding", "utf8",
        "-Xmax-classfile-name", "140"
    ]
)

toolchain(
    name = "scala_toolchain",
    toolchain_type = "@io_bazel_rules_scala//scala:toolchain_type",
    toolchain = "scala_toolchain_impl"
)
