## Description

Extending the code of UICollectionView CellRegistration.

You should read [here](https://qiita.com/hcrane/private/c89a256130040adb46dd).

```.swift
extension UICollectionView {

    // 1. from class
    func dequeueReusableCell<C, I>(
        class: C.Type,
        with item: I,
        at indexPath: IndexPath,
        handler: @escaping UICollectionView.CellRegistration<C, I>.Handler
    ) -> UICollectionViewCell where
        C: UICollectionViewListCell,
        I: Hashable
    {
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, I>(
                handler: handler
            ),
            for: indexPath,
            item: item
        )
    }
    
    /// 2. from Xib
    func dequeueReusableCell<C, I>(
        type: C.Type,
        with item: I,
        at indexPath: IndexPath,
        handler: @escaping UICollectionView.CellRegistration<C, I>.Handler
    ) -> UICollectionViewCell where
        C: UICollectionViewListCell,
        I: Hashable
    {
        dequeueConfiguredReusableCell(
            using: UICollectionView.CellRegistration<C, I>(
                cellNib: UINib(nibName: String(describing: type.self), bundle: nil),
                handler: handler
            ),
            for: indexPath,
            item: item
        )
    }
}
```
