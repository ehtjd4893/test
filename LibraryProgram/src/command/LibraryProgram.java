package command;

import java.util.List;
import java.util.Scanner;

import dao.BookDao;
import vo.BookVO;

public class LibraryProgram {
	
	private BookDao bookDao = BookDao.getInstance();
	private Scanner sc = new Scanner(System.in);
	public void printBookList() {
		List<BookVO> list = bookDao.selectBookList();
		for(BookVO vo : list) {
			System.out.println(vo);
		}
	}

	public void printBook() {
		System.out.print("도서 번호 입력 >>>");
		int book_no = sc.nextInt();
		BookVO vo = bookDao.selectBookOne(book_no);
		if(vo == null) {
			System.out.println("없는 도서입니다.");
		} else {
			System.out.println(vo);
		}
	}
	
	public void execute() {
		while(true) {
			System.out.println("도서 검색 서비스");
			System.out.println("1. 전체 도서 검색");
			System.out.println("2. 선택 도서 검색");
			System.out.println("3.프로그램 종료");

			switch(sc.nextInt()) {
			case 1: 
				printBookList(); break;
			case 2: 
				printBook(); break;
			
			case 3: 
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("존재하지 않는 명령어입니다.");
			}
			
		}
	}
}
