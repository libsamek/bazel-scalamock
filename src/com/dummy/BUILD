load("@io_bazel_rules_scala//scala:scala.bzl", "scala_binary", "scala_library", "scala_test")

scala_test(
    name = "scalamock",
    srcs = glob(["*.scala"]),
    deps = [
        "//3rdparty/jvm/org/scalamock:scalamock_scalatest_support",
    ],
)
