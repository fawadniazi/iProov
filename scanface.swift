//
//  scanface.swift
//  iosapp-iproov
//
//  Created by Fawad Niazi on 15/3/25.
//

import iProov
import iProovAPIClient
import MBProgressHUD
import UIKit

private func launch(claimType: ClaimType, assuranceType: AssuranceType) {
    guard let userID = userIDTextField.text, !userID.isEmpty else {
        let alert = UIAlertController(title: "Error", message: "Please enter a User ID", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        return
    }

    userIDTextField.resignFirstResponder()

    let hud = MBProgressHUD.showAdded(to: view, animated: true)
    hud.mode = .indeterminate
    hud.label.text = "Getting token..."

    apiClient.getToken(assuranceType: assuranceType,
                       type: claimType,
                       userID: userID)
    { result in

        switch result {
        case let .success(token):

            let options = Options()

            let streamingURL = URL(string: "wss://\(Credentials.hostname)/ws")!
            IProov.launch(streamingURL: streamingURL, token: token, options: options) { status in

                switch status {
                case .connecting:
                    hud.mode = .indeterminate
                    hud.label.text = "Connecting..."

                case .connected:
                    break

                case let .processing(progress, message):
                    hud.mode = .determinateHorizontalBar
                    hud.label.text = message
                    hud.progress = Float(progress)

                case .success:
                    hud.hide(animated: true)

                    let alert = UIAlertController(title: "✅ Success", message: "Token: \(token)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)

                case let .failure(result):
                    hud.hide(animated: true)

                    let alert = UIAlertController(title: "❌ \(result.reason)", message: result.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                        self.launch(claimType: claimType, assuranceType: assuranceType)
                    }))
                    self.present(alert, animated: true, completion: nil)

                case .canceled:
                    hud.hide(animated: true)

                case let .error(error):
                    hud.hide(animated: true)

                    let alert = UIAlertController(title: "❌ Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                    alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                        self.launch(claimType: claimType, assuranceType: assuranceType)
                    }))
                    self.present(alert, animated: true, completion: nil)

                @unknown default:
                    break
                }
            }

        case let .failure(error):
            hud.hide(animated: true)

            let alert = UIAlertController(title: "Failed to get token", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
                self.launch(claimType: claimType, assuranceType: assuranceType)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
