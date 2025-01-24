//
//  add_AutoLayout_Constraints_ProgrammaticallyUITestsLaunchTests.swift
//  add AutoLayout Constraints ProgrammaticallyUITests
//
//  Created by Alimullah on 24/1/25.
//

import XCTest

final class add_AutoLayout_Constraints_ProgrammaticallyUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
