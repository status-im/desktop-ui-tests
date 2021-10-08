import QtQuick 2.14
import QtTest 1.14

import "base"

import StatusQ.Core.Theme 0.1

TestCase {
    name: "initialTest"

    Helpers { id: helpers }

    function initTestCase() {
    }

    function cleanupTestCase() {
    }

    function test_case1() {
        verify(!!Theme.palette, "Theme available");
        verify(helpers.checkClassName(Theme.palette, "StatusLightTheme"))
    }
}
