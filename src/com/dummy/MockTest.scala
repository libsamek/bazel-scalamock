package com.dummy

import org.scalatest._
import org.scalamock.scalatest.MockFactory

class MockTest extends FunSuite with MockFactory {
  test("emptiness") {
    assert(true)
  }

  test("dummy test") {
    val mockObj = mock[Client]

    (mockObj.describe _).expects(*).returning("dummy string")

    assert(mockObj.describe("1.2.3.4") == "dummy string")
  }
}
