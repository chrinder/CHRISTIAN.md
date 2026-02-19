# Philosophy

1. **Readability over cleverness** - Code is read far more than it's written. Every pattern here optimizes for the reader, not the writer.
2. **Simplicity over sophistication** - No complex package hierarchies or enterprise patterns. Flat folders, simple names, minimal abstraction.
3. **Explicit over implicit** - When you deviate from defaults, say why. No magic.
4. **Tests as documentation** - Test class + method name reads as a sentence describing behavior.
5. **Leverage existing solutions** - Don't reinvent. Use the libraries provided.

## Post-Write Rule

After creating or modifying any `.cls`, `.trigger`, or `*-meta.xml` file, always run `/sf-code-analyzer` on the changed files before considering the task complete.
