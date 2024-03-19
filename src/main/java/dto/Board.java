package dto;

public class Board {
	private int num;
	private String title;
	private String content;
	private String writer;
	private String regtime;
	private int hits;
	
	public Board() {}
	
	public Board(String title, String content) {
		this(0, title, content, "", "", 0);
	}

	public Board(int num, String title, String content) {
		this(num, title, content, "", "", 0);
	}

	public Board(String title, String content, String writer) {
		this(0, title, content, writer, "", 0);
	}

	public Board(int num, String title, String content, String writer, String regtime, int hits) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;     //p2_mem 테이블의 nickname의 외래키
		this.regtime = regtime;
		this.hits = hits;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegtime() {
		return regtime;
	}

	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer + ", regtime="
				+ regtime + ", hits=" + hits + "]";
	}
}
