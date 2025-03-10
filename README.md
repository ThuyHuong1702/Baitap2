## Ket qua
![alt](anh1.jpg)

1. Define Routing (Định nghĩa tuyến đường)
Trong Laravel, bạn có thể định nghĩa route trong file routes/web.php.
Ví dụ:
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return "Chào mừng đến với Laravel!";
});
Giải thích:
Route::get('/', function () { ... }); định nghĩa một route GET cho trang chủ (/).
Khi truy cập http://localhost:8000/, Laravel sẽ trả về chuỗi "Chào mừng đến với Laravel!".
2. Route Parameters (Tham số trong route)
Laravel hỗ trợ route với tham số động.
Ví dụ
Route::get('/user/{id}', function ($id) {
    return "User ID: " . $id;
});

Giải thích:
{id} là tham số động.
Khi truy cập http://localhost:8000/user/5, Laravel sẽ hiển thị "User ID: 5".
Tham số có giá trị mặc định

Route::get('/user/{id?}', function ($id = 'Không có ID') {
    return "User ID: " . $id;
});

Giải thích:
{id?} là tham số tùy chọn (? có nghĩa là có thể không có tham số).
Nếu không truyền ID, Laravel sẽ trả về "User ID: Không có ID"
3. Name Routes (Định danh route)
Khi bạn đặt tên cho một route, bạn có thể tham chiếu nó dễ dàng hơn.
Ví dụ
Route::get('/dashboard', function () {
    return "Welcome to Dashboard";
})->name('dashboard');

Gọi route bằng tên
$url = route('dashboard'); 
echo "<a href='$url'>Go to Dashboard</a>";

Giải thích:
->name('dashboard') đặt tên cho route.
route('dashboard') sẽ trả về đường dẫn /dashboard.
4. Route Grouping (Nhóm tuyến đường)
Nhóm các route có chung prefix hoặc middleware.
Ví dụ
Route::prefix('admin')->group(function () {
    Route::get('/users', function () {
        return "Danh sách người dùng";
    });

    Route::get('/posts', function () {
        return "Danh sách bài viết";
    });
});

Giải thích:
Tất cả các route bên trong nhóm sẽ có tiền tố /admin.
Truy cập /admin/users sẽ hiển thị "Danh sách người dùng".
Truy cập /admin/posts sẽ hiển thị "Danh sách bài viết".

5. Route Methods (Các phương thức HTTP trong route)
Laravel hỗ trợ nhiều phương thức HTTP như GET, POST, PUT, DELETE.
Ví dụ
Route::post('/submit', function () {
    return "Form submitted!";
});

Gửi yêu cầu POST đến /submit sẽ hiển thị "Form submitted!".
6. Fallback Route (Xử lý route không tìm thấy)
Khi người dùng truy cập một route không tồn tại, ta có thể hiển thị thông báo lỗi tùy chỉnh.
Ví dụ
Route::fallback(function () {
    return "Trang bạn tìm kiếm không tồn tại!";
});

Giải thích:
Nếu truy cập một URL không khớp với route nào, Laravel sẽ trả về "Trang bạn tìm kiếm không tồn tại!".

7. Passing and Rendering Data In Templates (Truyền và hiển thị dữ liệu trong Blade)
Chúng ta có thể truyền dữ liệu từ Controller đến View.
Ví dụ Controller

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $title = "Trang chủ Laravel";
        return view('home', compact('title'));
    }
}

Trong View (resources/views/home.blade.php)
blade
Sao chépChỉnh sửa
<h1>{{ $title }}</h1>

Giải thích:
$title được truyền từ Controller vào View bằng compact().

8. Build Application Layout (Tạo Layout ứng dụng)
Laravel sử dụng Blade Layouts để giúp tái sử dụng giao diện.
Layout chính (resources/views/layouts/app.blade.php)

<!DOCTYPE html>
<html lang="en">
<head>
    <title>@yield('title')</title>
</head>
<body>
    @yield('content')
</body>
</html>

Trang sử dụng layout (resources/views/home.blade.php)

@extends('layouts.app')

@section('title', 'Trang chủ')

@section('content')
    <h1>Chào mừng đến với Laravel!</h1>
@endsection

Giải thích:
@yield('title') và @yield('content') giúp định nghĩa các phần nội dung có thể thay đổi.

9. Loops in Template (Vòng lặp trong Blade)
Dùng vòng lặp để hiển thị danh sách dữ liệu.
Ví dụ

@foreach ($users as $user)
    <p>{{ $user }}</p>
@endforeach

Giải thích:
Nếu $users = ['Alice', 'Bob', 'Charlie'], Laravel sẽ hiển thị danh sách tên.

10. Conditional Rendering (Điều kiện trong Blade)
Dùng @if, @else, @isset, @empty để kiểm tra điều kiện.
Ví dụ
@if ($age >= 18)
    <p>Bạn đủ tuổi truy cập</p>
@else
    <p>Bạn chưa đủ tuổi</p>
@endif

Giải thích:
Nếu $age = 20, sẽ hiển thị "Bạn đủ tuổi truy cập".

11. Including Sub View (Nhúng View con)
Blade hỗ trợ @include để tái sử dụng các phần giao diện.
Header (resources/views/components/header.blade.php)

<header>
    <h1>Laravel Website</h1>
</header>

Nhúng vào layout

@include('components.header')

Giải thích:
@include('components.header') sẽ chèn nội dung của header.blade.php vào.

12. Useful Blade Directives (Các chỉ thị Blade hữu ích)
Một số chỉ thị quan trọng:
@csrf: Bảo vệ form khỏi tấn công CSRF.
@method('PUT'): Dùng trong form khi muốn gửi yêu cầu PUT.
@auth / @guest: Kiểm tra xem người dùng đã đăng nhập chưa.
Ví dụ form

<form method="POST" action="/update">
    @csrf
    @method('PUT')

    <button type="submit">Cập nhật</button>
</form>

Giải thích:
@csrf: Tạo token bảo vệ form.
@method('PUT'): Giúp form gửi yêu cầu PUT thay vì POST.
BÀI TẬP
/my-laravel-app
│── /routes
│   └── web.php
│── /resources
│   └── /views
│       ├── layouts
│       │   ├── app.blade.php   (Layout chính)
│       │   ├── styles.blade.php (File chứa CSS)
│       │   ├── scripts.blade.php (File chứa JS)
│       ├── components
│       │   ├── header.blade.php (Header)
│       │   ├── sidebar.blade.php (Sidebar)
│       │   ├── footer.blade.php (Footer)
│       ├── pages
│       │   ├── home.blade.php (Nội dung trang chủ)
│       │   ├── about.blade.php (Nội dung trang giới thiệu)
│── /public
│   ├── /css
│   │   ├── style.css
│   ├── /js
│   │   ├── script.js

2. Định nghĩa Routing (routes/web.php)
use Illuminate\Support\Facades\Route;

// Trang chủ
Route::get('/', function () {
    return view('pages.home');
})->name('home');

// Trang giới thiệu
Route::get('/about', function () {
    return view('pages.about');
})->name('about');

3. Layout chính (resources/views/layouts/app.blade.php)
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    
    <!-- Nhúng file CSS -->
    @include('layouts.styles')
</head>
<body>
    <!-- Header -->
    @include('components.header')

    <div class="container">
        <!-- Sidebar -->
        @include('components.sidebar')

        <!-- Nội dung chính -->
        <div class="content">
            @yield('content')
        </div>
    </div>

    <!-- Footer -->
    @include('components.footer')

    <!-- Nhúng file JS -->
    @include('layouts.scripts')
</body>
</html>
Giải thích:
@include('layouts.styles') → Nhúng file chứa CSS.
@include('components.header'), @include('components.sidebar'), @include('components.footer') → Nhúng các phần của giao diện.
@yield('content') → Hiển thị nội dung từ từng trang cụ thể.

4. Các thành phần giao diện
(a) Header (resources/views/components/header.blade.php)
<header>
    <h1>My Laravel Website</h1>
    <nav>
        <a href="{{ route('home') }}">Home</a>
        <a href="{{ route('about') }}">About</a>
    </nav>
</header>
b) Sidebar (resources/views/components/sidebar.blade.php)
<aside>
    <h2>Danh mục</h2>
    <ul>
        <li><a href="#">Danh mục 1</a></li>
        <li><a href="#">Danh mục 2</a></li>
        <li><a href="#">Danh mục 3</a></li>
    </ul>
</aside>
c) Footer (resources/views/components/footer.blade.php)
<footer>
    <p>&copy; 2025 Laravel Website. All rights reserved.</p>
</footer>
5. Các trang nội dung
(a) Trang chủ (resources/views/pages/home.blade.php)
@extends('layouts.app')

@section('title', 'Trang Chủ')

@section('content')
    <h2>Chào mừng đến với Laravel</h2>
    <p>Đây là nội dung trang chủ.</p>
@endsection
(b) Trang giới thiệu (resources/views/pages/about.blade.php)

@extends('layouts.app')

@section('title', 'Giới Thiệu')

@section('content')
    <h2>Giới Thiệu</h2>
    <p>Đây là trang giới thiệu của website.</p>
@endsection
 6. Chia nhỏ CSS và JS
(a) File chứa CSS (resources/views/layouts/styles.blade.php)

<link rel="stylesheet" href="{{ asset('css/style.css') }}">
(b) File chứa JS (resources/views/layouts/scripts.blade.php)

<script src="{{ asset('js/script.js') }}"></script>
(c) File style.css (public/css/style.css)
css
Sao chépChỉnh sửa
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}
header {
    background: #007bff;
    color: white;
    padding: 10px;
    text-align: center;
}
.container {
    display: flex;
}
.sidebar {
    width: 20%;
    background: #f4f4f4;
    padding: 10px;
}
.content {
    width: 80%;
    padding: 10px;
}
footer {
    background: #333;
    color: white;
    text-align: center;
    padding: 10px;
}
(d) File script.js (public/js/script.js)

document.addEventListener("DOMContentLoaded", function() {
    console.log("Website đã tải xong!");
});
7. Áp dụng Blade Directives
Dưới đây là cách dùng Blade Directives để hiển thị dữ liệu động.
Sử dụng vòng lặp (@foreach)
@php
    $categories = ['Danh mục 1', 'Danh mục 2', 'Danh mục 3'];
@endphp

<ul>
    @foreach ($categories as $category)
        <li>{{ $category }}</li>
    @endforeach
</ul>

Điều kiện hiển thị (@if, @else)
@php
    $user = 'admin';
@endphp

@if ($user === 'admin')
    <p>Xin chào, Admin!</p>
@else
    <p>Xin chào, người dùng!</p>
@endif


8. Fallback Route (routes/web.php)

Route::fallback(function () {
    return view('pages.404');
});

Trang lỗi 404 (resources/views/pages/404.blade.php)
@extends('layouts.app')

@section('title', 'Lỗi 404')

@section('content')
    <h2>404 - Trang không tồn tại</h2>
    <p>Vui lòng kiểm tra lại URL.</p>
@endsection

Kết quả mong đợi
🔹 Khi truy cập /, sẽ thấy Trang chủ với Header, Sidebar, Content, Footer.
🔹 Khi truy cập /about, sẽ thấy Trang Giới Thiệu với cấu trúc tương tự.
🔹 Nếu nhập sai URL, sẽ thấy trang 404.
