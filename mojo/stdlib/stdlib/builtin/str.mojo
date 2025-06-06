# ===----------------------------------------------------------------------=== #
# Copyright (c) 2025, Modular Inc. All rights reserved.
#
# Licensed under the Apache License v2.0 with LLVM Exceptions:
# https://llvm.org/LICENSE.txt
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ===----------------------------------------------------------------------=== #
"""Provides the `str` function.

These are Mojo built-ins, so you don't need to import them.
"""

# ===----------------------------------------------------------------------=== #
# Stringable
# ===----------------------------------------------------------------------=== #


trait Stringable:
    """
    The `Stringable` trait describes a type that can be converted to a
    [`String`](/mojo/stdlib/collections/string/String).

    Any type that conforms to `Stringable` or
    [`StringableRaising`](/mojo/stdlib/builtin/str/StringableRaising) works
    with the built-in [`print()`](/mojo/stdlib/builtin/io/print) and
    [`String()`](/mojo/stdlib/builtin/str/str) functions.

    The `Stringable` trait requires the type to define the `__str__()` method.
    For example:

    ```mojo
    struct Foo(Stringable):
        var s: String

        fn __str__(self) -> String:
            return self.s
    ```

    Now you can pass an instance of `Foo` to the `String()` function to get back a
    `String`:

    ```mojo
    var foo = Foo("test")
    print(String(foo) == "test")
    ```

    ```plaintext
    True
    ```

    **Note:** If the `__str__()` method might raise an error, use the
    [`StringableRaising`](/mojo/stdlib/builtin/str/StringableRaising)
    trait, instead.

    About the difference between `__repr__()` and `__str__()`:
    The method `__repr__` computes the "official" string representation of an object
    while `__str__` computes the "informal" or nicely printable string representation of an object.

    This method differs from `__repr__()` in that there is no expectation that `__str__()`
    return a valid Mojo expression: a more convenient or concise representation can be used.
    """

    fn __str__(self) -> String:
        """Get the string representation of the type.

        Returns:
            The string representation of the type.
        """
        ...


trait StringableRaising:
    """The StringableRaising trait describes a type that can be converted to a
    [`String`](/mojo/stdlib/collections/string/String).

    Any type that conforms to
    [`Stringable`](/mojo/stdlib/builtin/str/Stringable) or
    `StringableRaising` works with the built-in
    [`print()`](/mojo/stdlib/builtin/io/print) and
    [`String()`](/mojo/stdlib/builtin/str/str) functions.

    The `StringableRaising` trait requires the type to define the `__str__()`
    method, which can raise an error. For example:

    ```mojo
    struct Foo(StringableRaising):
        var s: String

        fn __str__(self) raises -> String:
            if self.s == "":
                raise Error("Empty String")
            return self.s
    ```

    Now you can pass an instance of `Foo` to the `String()` function to get back a
    `String`:

    ```mojo
    fn main() raises:
        var foo = Foo("test")
        print(String(foo) == "test")
    ```

    ```plaintext
    True
    ```
    """

    fn __str__(self) raises -> String:
        """Get the string representation of the type.

        Returns:
            The string representation of the type.

        Raises:
            If there is an error when computing the string representation of the type.
        """
        ...
