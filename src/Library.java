import java.util.*;
import java.util.stream.Collectors;

class Library {
    private final Map<Integer, Book> books = new HashMap<>();

    public void addBook(Book book) {
        books.put(book.getId(), book);
    }

    public Book getBookById(int id) {
        return books.get(id);
    }

    public Map<Boolean, List<String>> getBooksByAvailability() {
        return books.values().stream()
                .collect(Collectors.partitioningBy(Book::getIsAvailable, Collectors.mapping(Book::getTitle, Collectors.toList())));
    }

    public Map<String, List<String>> getBooksByAuthor() {
        return books.values().stream()
                .collect(Collectors.groupingBy(Book::getAuthor,Collectors.mapping(Book::getTitle, Collectors.toList())));
    }

    public List<Book> getBooksSortedByTitle() {
        return books.values().stream()
                .sorted(Comparator.comparing(Book::getTitle))
                .collect(Collectors.toList());
    }

    public List<Book> getBooks(boolean isAvailable) {
        return books.values().stream()
                .filter(book -> book.getIsAvailable() == isAvailable)
                .collect(Collectors.toList());
    }

    public int getTotalNumberOfBooks() {
        return books.size();
    }

    public int getNumberOfAvailableBooks() {
        return (int) books.values().stream()
                .filter(Book::getIsAvailable)
                .count();
    }

    public List<String> getAuthors() {
        return books.values().stream()
                .map(Book::getAuthor)
                .distinct()
                .sorted()
                .collect(Collectors.toList());
    }
}