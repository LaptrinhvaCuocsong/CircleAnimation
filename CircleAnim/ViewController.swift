//
//  ViewController.swift
//  CircleAnim
//
//  Created by Nguyen Manh Hung on 4/17/21.
//

import PinLayout
import UIKit

class ViewController: UIViewController {

    private let imgSize = CGSize(width: 112, height: 112)
    private let cellIdentifier = "cellIdentifier"
    private let user = User(username: "hungcoutinho",
                            password: "abcxyz",
                            email: "nguyenmanhhung131298@gmail.com",
                            address: "Quang Thuy, Quang Trach, Quang Binh",
                            job: "iOS developer")
    
    private var userInfo: [(title: String, value: String)] {
        return user.publicInfo()
    }
    
    // MARK: - Components
    
    private lazy var coverImgView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.image = UIImage(named: "background")
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private lazy var coverView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var avatarImgView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.image = UIImage(named: "person")
        imgView.contentMode = .scaleAspectFill
        imgView.layer.cornerRadius = imgSize.height / 2
        imgView.layer.maskedCorners = .all
        imgView.layer.masksToBounds = true
        return imgView
    }()
    
    private lazy var avatarView: UIView = {
        let view = UIView(frame: .zero)
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0), size: imgSize),
                                byRoundingCorners: .allCorners,
                                cornerRadii: CGSize(width: imgSize.width / 2, height: imgSize.height / 2))
        view.layer.shadowPath = path.cgPath
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.85
        view.layer.shadowColor = UIColor.black.cgColor
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var tblView: UITableView = {
        let tblView = UITableView(frame: .zero)
        tblView.dataSource = self
        tblView.delegate = self
        tblView.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        return tblView
    }()
    
    // MARK: - Lifecircle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ProgressHUD.shared.showProgress()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        view.addSubview(coverView)
        coverView.addSubview(coverImgView)
        coverView.sendSubviewToBack(coverImgView)
        avatarView.addSubview(avatarImgView)
        coverView.addSubview(avatarView)
        view.addSubview(tblView)
        view.sendSubviewToBack(tblView)
    }
    
    private func layoutUI() {
        coverView.pin.top().left().right().height(260.scaleH)
        coverImgView.pin.top().left().bottom().right()
        avatarView.pin.width(imgSize.width).height(imgSize.height).bottom(-imgSize.height * 0.25).hCenter()
        avatarImgView.pin.top().left().bottom().right()
        tblView.pin.below(of: coverView).left().right().bottom()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        cell!.textLabel?.text = userInfo[indexPath.row].title
        cell!.detailTextLabel?.text = userInfo[indexPath.row].value
        return cell!
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
