load("@io_bazel_rules_scala//scala:scala.bzl", "scala_library")
load("@io_bazel_rules_scala//scala:scala_import.bzl", "scala_import")
java_library(
    name = "scalamock_core_2_11",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/scala_lang:scala_reflect",
        "//external:jar/org/scalamock/scalamock_core_2_11"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



scala_import(
    name = "scalamock_scalatest_support",
    exports = [
        "//3rdparty/jvm/org/scala_lang:scala_library",
        "//3rdparty/jvm/org/scalatest:scalatest",
        ":scalamock_core_2_11"
    ],
    jars = [
        "//external:jar/org/scalamock/scalamock_scalatest_support_2_11"
    ],
    visibility = [
        "//visibility:public"
    ]
)


