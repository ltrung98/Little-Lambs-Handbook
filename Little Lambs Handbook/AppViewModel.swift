//
//  AppViewModel.swift
//  Little Lambs Handbook
//
//  Created by Ted Nguyen on 1/10/26.
//
import Foundation
import Observation

@Observable
final class AppViewModel {
    var kidPassport = KidPassport()

    let handbookSections: [HandbookSection] = [
        .init(number: "I", title: "Những ngày đầu tiên của bé tại Cừu Nhỏ", items: [
            "Khóc khi ba mẹ rời đi.",
            "Bám ba mẹ, không muốn vào lớp.",
            "Ăn ít hơn hoặc chưa quen với các cữ ăn tại trường.",
            "Khó ngủ hoặc ngủ ít hơn bình thường.",
            "Thay đổi cảm xúc, dễ cáu hoặc nhạy cảm hơn.",
            "Chưa chủ động tham gia các hoạt động cùng cô và các bạn.",
            "Ba mẹ chuẩn bị tâm lý cho bé trước khi đi học.",
            "Duy trì giờ ngủ và sinh hoạt tương đối ổn định.",
            "Chào bé ngắn gọn, vui vẻ và hạn chế kéo dài thời gian chia tay.",
            "Không tạo áp lực buộc bé phải ăn hết, ngủ ngay hoặc tham gia tất cả hoạt động trong những ngày đầu."
        ]),
        .init(number: "II", title: "Quy trình ăn uống trong ngày", items: [
            "Bữa sáng tại trường theo thực đơn của nhà trường.",
            "Bữa phụ sáng / cữ sữa theo lịch sinh hoạt và chính sách dinh dưỡng.",
            "Bữa trưa theo thực đơn của trường.",
            "Bữa xế và phụ xế theo thực đơn của nhà trường.",
            "Nhà trường khuyến khích và hỗ trợ bé hình thành thói quen ăn uống tích cực, không tạo áp lực hoặc ép buộc trẻ ăn.",
            "Ba mẹ cần thông báo nếu bé có dị ứng thực phẩm, chế độ ăn đặc biệt hoặc vấn đề sức khỏe liên quan đến dinh dưỡng."
        ]),
        .init(number: "III", title: "Dịch vụ ăn chiều & trông muộn", items: [
            "Đăng ký dịch vụ theo quy định.",
            "Chủ động thông báo khi có thay đổi.",
            "Đón bé đúng thời gian đã đăng ký.",
            "Phối hợp với nhà trường trong trường hợp phát sinh đột xuất.",
            "Việc đăng ký giúp nhà trường chủ động bố trí nhân sự, suất ăn và đảm bảo việc chăm sóc bé được chu đáo."
        ]),
        .init(number: "IV", title: "Tương tác giữa Nhà trường & Phụ huynh", items: [
            "Zalo: trao đổi thông tin hàng ngày.",
            "Thông báo các hoạt động của lớp/trường.",
            "Trao đổi những vấn đề liên quan trực tiếp đến bé.",
            "Gửi thông báo và các nội dung cần phụ huynh phối hợp.",
            "Ba mẹ vui lòng kiểm tra Zalo thường xuyên và phản hồi khi nhà trường cần xác nhận thông tin.",
            "EMIS Kinder: theo dõi sức khỏe, quản lý hồ sơ sức khỏe, hình ảnh/video và thông tin về một ngày học tập, sinh hoạt của bé."
        ]),
        .init(number: "V", title: "Các khoản phí", items: [
            "Phí cố định được tính theo chính sách của nhà trường.",
            "Học phí được thu theo tháng và theo mức phí áp dụng cho chương trình bé đang theo học.",
            "Phí ăn được tính theo số ngày/định mức ăn theo chính sách của nhà trường.",
            "Báo nghỉ đúng quy trình giúp nhà trường chủ động điều chỉnh suất ăn.",
            "Hoàn/điều chỉnh phí ăn khi phụ huynh đăng ký nghỉ đúng quy định và đơn nghỉ được xác nhận hợp lệ."
        ]),
        .init(number: "VI", title: "Chương trình học tại Chú Cừu Nhỏ", items: [
            "Học thông qua trải nghiệm – tương tác – khám phá.",
            "Tiếng Anh tương tác cùng giáo viên nước ngoài và giáo viên Việt Nam.",
            "Mĩ thuật – Art: khám phá màu sắc và chất liệu, phát triển quan sát, sự khéo léo, sáng tạo và tự tin.",
            "Cờ Vua dành cho bé từ 4 tuổi trở lên: tư duy logic, tập trung, ghi nhớ, quan sát, lập kế hoạch, kiên nhẫn và tuân thủ luật chơi.",
            "Hàng tháng bé có cơ hội tham gia Workshop hoặc Field Trip phù hợp với chủ đề và độ tuổi."
        ]),
        .init(number: "VII", title: "Lời nhắn gửi ba mẹ", items: [
            "Mỗi ngày đến trường, hãy để con mang theo một tâm thế vui vẻ và trở về nhà với thật nhiều điều thú vị!",
            "Tin tưởng – Trao đổi – Phối hợp – Kiên nhẫn – Đồng hành cùng Cừu Nhỏ."
        ])
    ]

    func setupJourney() {
        guard kidPassport.activities.isEmpty else { return }
        kidPassport.activities = [
            .init(title: "Làm quen cô"),
            .init(title: "Làm quen bạn"),
            .init(title: "Làm quen môi trường"),
            .init(title: "Hình thành cảm giác an toàn"),
            .init(title: "Làm quen nề nếp")
        ]
    }
}

