ParallaxCollectionViewFlowLayout
================================

Use UICollectionViewFlowLayout to implement Parallax on cells in UICollectionView

* ParallaxCollectionViewFlowLayout inherited from UICollectionViewFlowLayout and could be applied into UICollectionView.
* It overrides layoutAttributesForElementsInRect: method to calcualte the layout attributes of cells which you want to do parallax.
* It needs to define cells which shoudl do parallax by enableParallaxCellsAtIndexPaths: or set allCellParallax YES for all.


