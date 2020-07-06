A. Cài đặt trên Máy tính:
     Bước 1: Mở Folder Release, Chọn File setup -> Enter hoặc nhấp đúp 2 lần để cài đặt.
     Bước 2: Khi xuất hiện khung cài đặt chọn Install, và đợi hoàn thành tiến trình cài đặt.
     Bước 3: Sau khi cài đặt thì biểu tượng phẩn mềm sẽ hiện trên Desktop với tên là Quản lý mua bán xe
Yêu cầu môi trường: Từ Window 7 64 bit trở lên.

Chú ý: Tài khoản đăng nhập
Bộ phận quản lý:
	Tên đăng nhập: huutrong
	Mật khẩu: 123456

Bộ phận tiếp nhận:
	Tên đăng nhập: tiepnhan
	Mật khẩu: 123456

Bộ phận kỹ thuật:
	Tên đăng nhập: anhthu
	Mật khẩu: 123456

Bộ phận bán hàng:
	Tên đăng nhập: maitinh
	Mật khẩu: 123456

================================================================================================================

B.Hướng dẫn chạy trên hệ công cụ Visual Studio.
Môi trường để chạy ứng dụng trên Visual Studio:
Sử dụng Visual Studio 2015 trở lên.
Cài đặt bộ công cụ hỗ trợ Devexpress 19.2.6:
https://go.devexpress.com/devexpressdownload_universaltrial.aspx
Tiến hành cài đặt. Sau khi cài đặt mở lại Visual Studio đợi hệ thống cập nhật lại.
Giải nén file QuanLyMuaBanXe
Mở Folder QuanLyMuaBanXe vừa giải nén trên Visual Studio 
Để cập nhật lại database vào nhấp chuột phải vào project => Properties
Giao diện Properties xuất hiện, Chọn vào phần Settings, Ở Bên phải có danh sách cập nhật chung cho hệ thống
Nhâp vào ô có Name:QuanLyMuaBanXeConnectionString , Nhấp vào ô Value sau đó xuất hiện nút có 3 dấu chấm chọn vào
Xuất hiện hộp thoại Connection Properties, Ở khung Server Name chọn lại đúng tên Server có database của phần mềm
Ở Phần Connect to a database chọn Tên của Database sau đó => Test Connection để kiểm tra kết nối => sau đó ấn OK
Có thể chạy phần mềm trên code Visual Studio