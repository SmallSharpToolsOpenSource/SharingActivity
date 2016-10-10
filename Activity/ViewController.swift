//
//  ViewController.swift
//  Activity
//
//  Created by Brennan Stehling on 10/10/16.
//  Copyright © 2016 SmallSharpTools LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties -

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    weak var activityViewController: UIActivityViewController?

    // MARK: - View Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.startAnimating()
    }

    // MARK: - User Actions -

    @IBAction func shareButtonTapped(_ sender: AnyObject) {
        share()
    }

    // MARK: - Private Functions -

    private func share() {
        let activityItems = ["Hello"]
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        controller.completionWithItemsHandler = { activity, success, items, error in
            debugPrint("Completed")
            self.activityIndicatorView.startAnimating()
            self.activityViewController = nil
        }

        // hold onto the controller since the local variable is released immediately
        activityViewController = controller

        present(controller, animated: true) {
            debugPrint("Presented")
            self.activityIndicatorView.stopAnimating()
        }
    }

}
