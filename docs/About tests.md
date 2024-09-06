# About tests

Tests use Singlethread option of vitest.config. Else, database-dependent tests will fail in the vast majority of cases (seed made during or after a test, giving erroneous results)

Use myPrismaModelCreateInput types for seeding

## Packed models

Create payload type version (packed version) of each model wich include other models. Example:

```ts
export type PackedProject = Prisma.ProjectGetPayload<{
  include: {
    cover: true;
    genre: true;
  };
}>;
```

No use for packedthing's example (raw data).
