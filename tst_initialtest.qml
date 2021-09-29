import QtQuick 2.14
import QtTest 1.14

import StatusQ.Core.Theme 0.1

TestCase {
    name: "initialTest"

    function initTestCase() {
    }

    function cleanupTestCase() {
    }

    function test_case1() {
        verify(!!Theme.palette, "Theme available");
    }
}
