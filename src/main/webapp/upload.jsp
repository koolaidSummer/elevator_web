<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <header class="header">
        <div class="header__logo">
            <a href="/index.jsp">
                <h1>ELEVATOR</h1>
            </a>
        </div>
    </header>

    <section class="submit-floor-form">
        <h1></h1>
        <div>
            <form action="upload" method="post" enctype="multipart/form-data">
                <div class="input-area">
                    <label for="uname">user name</label>
                    <input type="text" name="uname" autocomplete="off" style="IME-MODE: disabled" required />
                    
                </div>
                <div class="input-area">
                    <label for="floor">floor</label>
                    <input type="text" name="floor" autocomplete="off" style="IME-MODE: disabled" required/>
                </div>
                <div>
                    <label for="camcorder">video</label>
                    <input type="file" id="camcorder" name="file" capture="camcorder" accept="video/*" required />
                    
                </div>
                <div>
                    <label for="submit">submit</label>
                    <input type="submit" id="submit" value="submit" />
                </div>
        </div>
        </form>
    </section>
    
</body>
</html>