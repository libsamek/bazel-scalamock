# Do not edit. bazel-deps autogenerates this file from dependencies.yml.
def _jar_artifact_impl(ctx):
    jar_name = "%s.jar" % ctx.name
    ctx.download(
        output=ctx.path("jar/%s" % jar_name),
        url=ctx.attr.urls,
        sha256=ctx.attr.sha256,
        executable=False
    )
    src_name="%s-sources.jar" % ctx.name
    srcjar_attr=""
    has_sources = len(ctx.attr.src_urls) != 0
    if has_sources:
        ctx.download(
            output=ctx.path("jar/%s" % src_name),
            url=ctx.attr.src_urls,
            sha256=ctx.attr.src_sha256,
            executable=False
        )
        srcjar_attr ='\n    srcjar = ":%s",' % src_name

    build_file_contents = """
package(default_visibility = ['//visibility:public'])
java_import(
    name = 'jar',
    tags = ['maven_coordinates={artifact}'],
    jars = ['{jar_name}'],{srcjar_attr}
)
filegroup(
    name = 'file',
    srcs = [
        '{jar_name}',
        '{src_name}'
    ],
    visibility = ['//visibility:public']
)\n""".format(artifact = ctx.attr.artifact, jar_name = jar_name, src_name = src_name, srcjar_attr = srcjar_attr)
    ctx.file(ctx.path("jar/BUILD"), build_file_contents, False)
    return None

jar_artifact = repository_rule(
    attrs = {
        "artifact": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "urls": attr.string_list(mandatory = True),
        "src_sha256": attr.string(mandatory = False, default=""),
        "src_urls": attr.string_list(mandatory = False, default=[]),
    },
    implementation = _jar_artifact_impl
)

def jar_artifact_callback(hash):
    src_urls = []
    src_sha256 = ""
    source=hash.get("source", None)
    if source != None:
        src_urls = [source["url"]]
        src_sha256 = source["sha256"]
    jar_artifact(
        artifact = hash["artifact"],
        name = hash["name"],
        urls = [hash["url"]],
        sha256 = hash["sha256"],
        src_urls = src_urls,
        src_sha256 = src_sha256
    )
    native.bind(name = hash["bind"], actual = hash["actual"])


def list_dependencies():
    return [
    {"artifact": "org.scala-lang.modules:scala-parser-combinators_2.11:1.0.4", "lang": "java", "sha1": "7369d653bcfa95d321994660477a4d7e81d7f490", "sha256": "0dfaafce29a9a245b0a9180ec2c1073d2bd8f0330f03a9f1f6a74d1bc83f62d6", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.11/1.0.4/scala-parser-combinators_2.11-1.0.4.jar", "source": {"sha1": "2c66955d5543265eb450de4e9ec7ac467d94be54", "sha256": "8b8155720b40c0f7aee7dbc19d4b407307f6e57dd5394b58a3bc9849e28d25c1", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-parser-combinators_2.11/1.0.4/scala-parser-combinators_2.11-1.0.4-sources.jar"} , "name": "org_scala_lang_modules_scala_parser_combinators_2_11", "actual": "@org_scala_lang_modules_scala_parser_combinators_2_11//jar", "bind": "jar/org/scala_lang/modules/scala_parser_combinators_2_11"},
    {"artifact": "org.scala-lang.modules:scala-xml_2.11:1.0.5", "lang": "java", "sha1": "77ac9be4033768cf03cc04fbd1fc5e5711de2459", "sha256": "767e11f33eddcd506980f0ff213f9d553a6a21802e3be1330345f62f7ee3d50f", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.11/1.0.5/scala-xml_2.11-1.0.5.jar", "source": {"sha1": "ca7f8ffad89550695d29fdd45d251d2f41447a8c", "sha256": "c472bfbcccdd7b3843b4970f4538e943baccffa8ec21b4d7fea13274551e71b7", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/modules/scala-xml_2.11/1.0.5/scala-xml_2.11-1.0.5-sources.jar"} , "name": "org_scala_lang_modules_scala_xml_2_11", "actual": "@org_scala_lang_modules_scala_xml_2_11//jar", "bind": "jar/org/scala_lang/modules/scala_xml_2_11"},
# duplicates in org.scala-lang:scala-library promoted to 2.11.11
# - org.scala-lang.modules:scala-parser-combinators_2.11:1.0.4 wanted version 2.11.6
# - org.scala-lang.modules:scala-xml_2.11:1.0.5 wanted version 2.11.7
# - org.scala-lang:scala-reflect:2.11.11 wanted version 2.11.11
# - org.scalactic:scalactic_2.11:3.0.4 wanted version 2.11.11
# - org.scalamock:scalamock-core_2.11:3.6.0 wanted version 2.11.8
# - org.scalamock:scalamock-scalatest-support_2.11:3.6.0 wanted version 2.11.8
# - org.scalatest:scalatest_2.11:3.0.4 wanted version 2.11.11
    {"artifact": "org.scala-lang:scala-library:2.11.11", "lang": "java", "sha1": "e283d2b7fde6504f6a86458b1f6af465353907cc", "sha256": "f2ba1550a39304e5d06caaddfa226cdf0a4cbccee189828fa8c1ddf1110c4872", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.11.11/scala-library-2.11.11.jar", "source": {"sha1": "55fcd4c282604a1a57f7310f116b159b7bcdbbde", "sha256": "887d2d1d88630ad2c3b9652e8d250b800e8ce3d2857bc60da022e151580c5c37", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-library/2.11.11/scala-library-2.11.11-sources.jar"} , "name": "org_scala_lang_scala_library", "actual": "@org_scala_lang_scala_library//jar", "bind": "jar/org/scala_lang/scala_library"},
# duplicates in org.scala-lang:scala-reflect promoted to 2.11.11
# - org.scalactic:scalactic_2.11:3.0.4 wanted version 2.11.11
# - org.scalamock:scalamock-core_2.11:3.6.0 wanted version 2.11.8
# - org.scalatest:scalatest_2.11:3.0.4 wanted version 2.11.11
    {"artifact": "org.scala-lang:scala-reflect:2.11.11", "lang": "java", "sha1": "2addc7e09cf2e77e2243a5772bd0430c32c2b410", "sha256": "73aef1a6ccabd3a3c15cc153ec846e12d0f045587a2a1d88cc1b49293f47cb20", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.11.11/scala-reflect-2.11.11.jar", "source": {"sha1": "42209d46857d85366e9086db959eeb1f17c2397d", "sha256": "dd27214ed1b994894588b0c8763aee27efa226115a90bf9c3ce0eebe33b5025e", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scala-lang/scala-reflect/2.11.11/scala-reflect-2.11.11-sources.jar"} , "name": "org_scala_lang_scala_reflect", "actual": "@org_scala_lang_scala_reflect//jar", "bind": "jar/org/scala_lang/scala_reflect"},
    {"artifact": "org.scalactic:scalactic_2.11:3.0.4", "lang": "java", "sha1": "a97b52d531f6010b424813af260ac6ce748e187e", "sha256": "6d2b32b5839deae3398f34dd371b1921ad9ae2e1d5e35d91839d4acc8ba61a03", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.11/3.0.4/scalactic_2.11-3.0.4.jar", "source": {"sha1": "1f9080a1a21a60a75c679f73ab830cfadd14b7fd", "sha256": "f5cf7940e5f484e80c79595b965f8f9475e1f60619feb1ac8a589474b7fca5da", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalactic/scalactic_2.11/3.0.4/scalactic_2.11-3.0.4-sources.jar"} , "name": "org_scalactic_scalactic_2_11", "actual": "@org_scalactic_scalactic_2_11//jar", "bind": "jar/org/scalactic/scalactic_2_11"},
    {"artifact": "org.scalamock:scalamock-core_2.11:3.6.0", "lang": "java", "sha1": "9960233077aa495c357a35b839b5b50fcc4eee96", "sha256": "f21e216765a0d29eb3b45e331d06a8f500104204026ac93275afe84b9d4ba405", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalamock/scalamock-core_2.11/3.6.0/scalamock-core_2.11-3.6.0.jar", "source": {"sha1": "f12c1bd73d6b5075323ace3a3a19997f278db86b", "sha256": "fe5aa207261ef2ece3b998dee73b44b3ce8ff9c78dd279ebba93108e6ef931b3", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalamock/scalamock-core_2.11/3.6.0/scalamock-core_2.11-3.6.0-sources.jar"} , "name": "org_scalamock_scalamock_core_2_11", "actual": "@org_scalamock_scalamock_core_2_11//jar", "bind": "jar/org/scalamock/scalamock_core_2_11"},
    {"artifact": "org.scalamock:scalamock-scalatest-support_2.11:3.6.0", "lang": "scala", "sha1": "b1881122b2410e5a7e211c631e8fa3a9c31673b7", "sha256": "76bc3d222c079406f4f6dd4c2487441717017fabbf66e67d4a4f75a5215f4bc7", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalamock/scalamock-scalatest-support_2.11/3.6.0/scalamock-scalatest-support_2.11-3.6.0.jar", "source": {"sha1": "de3beeb9165e5d5174ef627bc97c925270dab5b1", "sha256": "f3b349c5753b19e95de61de0628a2c26bb6bd1485af522df1d79d472bd6e4b66", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalamock/scalamock-scalatest-support_2.11/3.6.0/scalamock-scalatest-support_2.11-3.6.0-sources.jar"} , "name": "org_scalamock_scalamock_scalatest_support_2_11", "actual": "@org_scalamock_scalamock_scalatest_support_2_11//jar:file", "bind": "jar/org/scalamock/scalamock_scalatest_support_2_11"},
    {"artifact": "org.scalatest:scalatest_2.11:3.0.4", "lang": "scala", "sha1": "a0df09cc87bb681674b05a883462b121866784e5", "sha256": "840d3909935581f505d15019e77982d66f979ac0da255c8f731077aa24c71335", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.11/3.0.4/scalatest_2.11-3.0.4.jar", "source": {"sha1": "08655df22f59757545c753159883caac6f9c3c0e", "sha256": "2895b455cef2c3b299a54f3663464b3eb90c7787f4b25c991fe6a2af7c68cff4", "repository": "https://repo.maven.apache.org/maven2/", "url": "https://repo.maven.apache.org/maven2/org/scalatest/scalatest_2.11/3.0.4/scalatest_2.11-3.0.4-sources.jar"} , "name": "org_scalatest_scalatest_2_11", "actual": "@org_scalatest_scalatest_2_11//jar:file", "bind": "jar/org/scalatest/scalatest_2_11"},
    ]

def maven_dependencies(callback = jar_artifact_callback):
    for hash in list_dependencies():
        callback(hash)
