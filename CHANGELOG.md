# 1.3.0 (2020-01-19)

- Adding Swift 5.1 support.
- Adding SPM support.

# 1.2 (2018-12-26)

- Updated to Swift 4.2.

# 1.1 (2018-08-26)

#### Thanks to [@adamstener](https://github.com/adamstener) for the big help with this release!
---

- `GradientAngle` has been added. You can choose from four predefined angles (`.vertical`, `.horizontal`, `.bottomLeftToTopRight`, `topLeftToBottomRight`) or initialize your own start and end points.

### Breaking changes

- `GradientDirection` has been removed. If you need to use `GradientDirection.darkToLight`, instead use the `.reversed` property of `GradientAngle`.
