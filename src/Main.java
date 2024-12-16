public class Main {
    public static void main(String[] args) {
        Library library = new Library();

        Book book1 = new Book(1, "Книга 1", "Автор 1", true);
        Book book2 = new Book(2, "Книга 2", "Автор 2", false);
        Book book3 = new Book(3, "Книга 3", "Автор 3", true);
        Book book4 = new Book(4, "Книга 4", "Автор 4", false);
        Book book5 = new Book(5, "Книга 5", "Автор 5", true);

        library.addBook(book1);
        library.addBook(book2);
        library.addBook(book3);
        library.addBook(book4);
        library.addBook(book5);

        System.out.println("Все книги, упорядоченные по названию:  ");
        library.getBooksSortedByTitle().forEach(b -> System.out.println(b.getTitle()));

        System.out.println("Доступные книги: ");
        library.getBooks(true).forEach(b -> System.out.println(b.getTitle()));

        System.out.println("Общее количество книг: " + library.getTotalNumberOfBooks());
        System.out.println("Количество доступных книг: " + library.getNumberOfAvailableBooks());

        System.out.println("Авторы: ");
        library.getAuthors().forEach(System.out::println);
    }
}