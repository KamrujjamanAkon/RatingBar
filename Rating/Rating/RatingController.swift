//
//  RatingController.swift
//  Rating
//
//  Created by Md. Kamrujjaman Akon on 2/4/17.
//
//

import UIKit

class RatingController: UIStackView {

    private var ratingButtons = [UIButton]()
    var rating = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }

    private func setupButtons()
    {
        for i in 0..<5
        {
            let button = UIButton()
            let image = UIImage(named: "ICC_emptyStar_2x.png") as UIImage?
            button.setImage(image, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
            button.tag = i

            button.addTarget(self, action: #selector(RatingController.ratingButtonPressed(button:)), for: .touchUpInside)

            addArrangedSubview(button)

            ratingButtons.append(button)
        }
    }

    func resetImage()
    {
        let image = UIImage(named: "ICC_emptyStar_2x.png") as UIImage?
        for i in 0..<5
        {
            ratingButtons[i].setImage(image, for: .normal)
        }
    }

    func setImage(n: Int)
    {
        resetImage()

        let image = UIImage(named: "ICC_highlightedStar_2x.png") as UIImage?
        for i in 0...n
        {
            ratingButtons[i].setImage(image, for: .normal)
        }
    }

    func ratingButtonPressed(button: UIButton)
    {
        print("Button pressed 👍")
        print(button.tag)

        setImage(n: button.tag)

    }
}
