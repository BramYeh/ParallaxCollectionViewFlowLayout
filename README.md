
ParallaxCollectionViewFlowLayout

Use UICollectionViewFlowLayout to implement Parallax on cells in UICollectionView

* ParallaxCollectionViewFlowLayout inherited from UICollectionViewFlowLayout and could be applied into UICollectionView.
* It overrides layoutAttributesForElementsInRect: method to calculate the layout attributes of cells which you want to do parallax.
* It needs to define cells which should do parallax by enableParallaxCellsAtIndexPaths: or set allCellParallax YES for all.
===================
* Set CollectionView's FlowLayout being ParallaxCollectionViewFlowLayout at Interface Builder
* Set which components you want to do parallax by 
	ParallaxCollectionViewFlowLayout *flowlayout = self.collectionView.collectionViewLayout;
	flowlayout.allCellParallax = YES;
===================
