#!/usr/bin/env bun

/**
 * Post-processor script to fix TypeSpec numeric enum types in OpenAPI spec.
 *
 * TypeSpec's OpenAPI3 emitter emits numeric enums as "type: number", but
 * we need "type: integer" with "format: int32" for proper server-side handling.
 *
 * This script converts:
 *   type: number
 *   enum: [1, 2, 3]
 *
 * To:
 *   type: integer
 *   format: int32
 *   enum: [1, 2, 3]
 */

import { readFileSync, writeFileSync } from "fs";
import { parse, stringify } from "yaml";

interface Schema {
  type?: string;
  enum?: unknown[];
  format?: string;
  anyOf?: Schema[];
  oneOf?: Schema[];
  [key: string]: unknown;
}

interface OpenAPISpec {
  components?: {
    schemas?: Record<string, Schema>;
  };
}

function fixEnumTypes(spec: OpenAPISpec): OpenAPISpec {
  // Check if spec has components/schemas
  if (!spec.components?.schemas) {
    return spec;
  }

  // Process each schema
  for (const [schemaName, schema] of Object.entries(spec.components.schemas)) {
    // Check if this is a numeric enum (type: number with enum array containing only integers)
    if (schema.type === "number" && Array.isArray(schema.enum)) {
      // Check if all enum values are integers
      const allIntegers = schema.enum.every((value) =>
        Number.isInteger(value)
      );

      if (allIntegers) {
        console.log(`Fixing ${schemaName}: type: number → type: integer`);
        schema.type = "integer";
        schema.format = "int32";
      }
    }

    // Also check anyOf/oneOf cases (for unions)
    if (schema.anyOf || schema.oneOf) {
      const variants = schema.anyOf || schema.oneOf;
      if (variants) {
        for (const variant of variants) {
          if (variant.type === "number" && Array.isArray(variant.enum)) {
            const allIntegers = variant.enum.every((value) =>
              Number.isInteger(value)
            );

            if (allIntegers) {
              console.log(
                `Fixing ${schemaName} variant: type: number → type: integer`
              );
              variant.type = "integer";
              variant.format = "int32";
            }
          }
        }
      }
    }
  }

  return spec;
}

// Main execution
const args = process.argv.slice(2);
if (args.length === 0) {
  console.error("Usage: fix-enum-types.ts <openapi-file.yaml>");
  process.exit(1);
}

const filePath = args[0];

try {
  console.log(`Processing ${filePath}...`);
  const content = readFileSync(filePath, "utf8");
  const spec = parse(content) as OpenAPISpec;

  const fixedSpec = fixEnumTypes(spec);

  const output = stringify(fixedSpec);
  writeFileSync(filePath, output, "utf8");

  console.log(`✓ Successfully fixed enum types in ${filePath}`);
} catch (error) {
  const message = error instanceof Error ? error.message : String(error);
  console.error(`Error processing file: ${message}`);
  process.exit(1);
}
