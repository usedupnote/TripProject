<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<footer class="footer py-4">
	<div class="container">
		<div class="row align-items-center justify-content-between">
			<div class="col-lg-4 text-lg-start">Copyright &copy; Your
				Website 2022</div>
			<div class="col-lg-4 text-lg-end">
				<a class="link-dark text-decoration-none me-3" href="#!">Privacy
					Policy</a> <a class="link-dark text-decoration-none" href="#!">Terms
					of Use</a>
			</div>
		</div>
	</div>
</footer>
<!-- Bootstrap core JS-->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
    <script>
		let msg = "${msg}";
		if(msg) alert(msg);
	</script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <!-- Core theme JS-->
    <script src="./assets/js/main.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <!--커스텀 js-->
    <script type="text/javascript" src="./assets/js/login.js"></script>