# SwiftSearchDemo
### 11月21日练习
* 搜索栏的使用，定义一个UISearchController，使用UISearchResultsUpdating并实现其代理方法：
```
    func updateSearchResults(for searchController: UISearchController) {
        if var text = searchController.searchBar.text {
            text = text.trimmingCharacters(in: .whitespaces)
            searchFilter(text: text)
            marvelTableView.reloadData()
        }
    }
```
使用数组的filter函数对原始数据进行筛选以实现搜索功能：
```
    func searchFilter(text: String) {
        self.searchResults = movies.filter({ (movie) -> Bool in
            return movie.name.localizedCaseInsensitiveContains(text)
        })
    }
```
