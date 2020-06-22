import { pickBy } from 'lodash'
import { SARSCOV2 } from './SARS-CoV-2_parameters'
import type { AnalysisParams, AnalysisResult } from './types'

import { geneMap } from './geneMap'
import { parseSequences } from './parseSequences'
import { isSequenceInClade } from './isSequenceInClade'
import { sequenceQC } from './sequenceQC'
import { alignPairwise } from './alignPairwise'
import { analyzeSeq } from './analyzeSeq'
import { findCharacterRanges } from './findCharacterRanges'
import { getAllAminoAcidChanges } from './getAllAminoAcidChanges'

export function parse(input: string) {
  return parseSequences(input)
}

export function analyze({ seqName, seq, rootSeq }: AnalysisParams): AnalysisResult {
  const { alignmentScore, query, ref } = alignPairwise(seq, rootSeq)

  const alignedQuery = query.join('')

  const { substitutions, insertions, deletions, alignmentStart, alignmentEnd } = analyzeSeq(query, ref)

  const clades = pickBy(SARSCOV2.clades, (clade) => isSequenceInClade(clade, substitutions, rootSeq))

  const missing = findCharacterRanges(alignedQuery, 'N')

  const aminoacidSubstitutions = getAllAminoAcidChanges(substitutions, rootSeq, geneMap)

  const diagnostics = sequenceQC(substitutions, insertions, deletions, alignedQuery)

  return Object.freeze({
    seqName,
    clades,
    missing,
    substitutions,
    aminoacidSubstitutions,
    insertions,
    deletions,
    alignmentStart,
    alignmentEnd,
    alignmentScore,
    diagnostics,
  })
}
